From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Apr 2020 19:56:07 +0200
Subject: [Buildroot] [PATCH v2] package/python-pycrypto: fix python3.8
 compatibility
In-Reply-To: <CADvTj4pNwr+Ova6kbwubJq3BdF-JyTXtmV-a_Pj2ztYk6q5+gQ@mail.gmail.com>
References: <20200420140724.3206074-1-romain.naour@gmail.com>
 <CADvTj4pNwr+Ova6kbwubJq3BdF-JyTXtmV-a_Pj2ztYk6q5+gQ@mail.gmail.com>
Message-ID: <503ac7d1-33cd-a0ef-1dd9-7456a3502568@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James, All,

Le 20/04/2020 ? 20:59, James Hilliard a ?crit?:
> On Mon, Apr 20, 2020 at 8:07 AM Romain Naour <romain.naour@gmail.com> wrote:
>>
>> Apply the patch from Fedora 31 [1][2] to replace the user-space RNG with a
>> thin wrapper to os.urandom. This allow to fixes compatibility with
>> Python 3.8 since the code containing time.clock() is removed.
> I wonder if it would be better to just replace pycrypto with pycryptodome
> which is supposed to be a drop in pycrypto replacement. It should essentially
> be a maintained pycrypto compatible version of pycryptodomex.
> See here for details:
> https://pycryptodome.readthedocs.io/en/latest/src/installation.html#installation

The only python-pycrypto user is crda package (python-pycrypto target and host
variant).
It would be great to switch to python-pycryptodomex and drop this package.
But before that, we have to add a python-pycryptodomex host variant for crda.

>>
>> time.clock() was deprecated in Python 3.3 and removed in Python 3.8.
>>
>> [1] https://src.fedoraproject.org/rpms/python-crypto/c/a5fd7148fb0e9d5526f24feb1bb708bf203480b9?branch=f31
>> [2] https://src.fedoraproject.org/rpms/python-crypto/blob/f31/f/pycrypto-2.6.1-use-os-random.patch
>>
>> Fixes:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144209
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>> This patch would allow to use python2 and python3.
>> To be backported to Buildroot 2020.02 to fixes the qemu-arm-vexpress-tz defconfig.

But this kind of changes is probably not suitable for 2020.02.x.

Best regards,
Romain
