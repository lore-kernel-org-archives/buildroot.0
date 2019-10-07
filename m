From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Mon, 7 Oct 2019 10:09:53 +0100
Subject: [Buildroot] [PATCH] download: Add SFTP support (not FTPS)
In-Reply-To: <20191006073609.GK10860@scaer>
References: <20191003145251.8647-1-thomas.preston@codethink.co.uk>
 <20191006073609.GK10860@scaer>
Message-ID: <47977bf1-e3cd-dfa8-1362-5405bdf14aa6@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Carlos,
Thanks for getting back to me on this.

On 06/10/2019 08:36, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2019-10-03 15:52 +0100, Thomas Preston spake thusly:
>> Add secure file transfer program (sftp) support using a simple wrapper.
>> SFTP is similar to FTP but it preforms all operations over an encrypted
>> SSH transport.
> 
> We'll want this to be documented in the manual, along with the other
> download methods (in docs/manual/adding-packages-generic.txt).
> 
> Also, as Carlos asked: will you be submitting a package that uses this
> feature?
> 
> If you do not plan to (e.g. because sftp, like scp, is most probably for
> intra-entreprise private downloads), then it would be nice to provide a
> test-case for this feature, otherwise it will be subject to bit-rot (if
> we happen to modify the download infra for example, we can be sure the
> sftp backend would not break).
> 
> You can add a test-case in support/testing/tests/download/.
> 

That's right, we require this feature for private downloads.

I will add documentation in v2. As for testing, would you expect some
kind of local SFTP server, as with:

	support/testing/tests/download/gitremote.py

Or will a known-working URL do? Ie.

	sftp sftp://demo at test.rebex.net/pub/example/readme.txt /tmp
