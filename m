From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 18 Mar 2010 20:22:32 +0200
Subject: [Buildroot] [PATCH RESEND] Fix autotools instalation with
	symbols
In-Reply-To: <20100307173913.401faec3@surf>
References: <20100307153359.10213.62431.stgit@localhost.localdomain>
	<20100307173913.401faec3@surf>
Message-ID: <4BA26F68.8020407@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/2010 06:39 PM, Thomas Petazzoni wrote:
> On Sun, 07 Mar 2010 17:33:59 +0200
> Paulius Zaleckas<paulius.zaleckas@gmail.com>  wrote:
>
>> When installing without symbols install-strip is used,
>> with symbols - install-exec.
>> Since install-exec installs only executables, we should use
>> simple install, to install other needed files also
>> (like files in /usr/shared) as install-strip does.
>>
>> Signed-off-by: Paulius Zaleckas<paulius.zaleckas@gmail.com>
>> Acked-by: Lionel Landwerlin<llandwerlin@gmail.com>
>
> Acked-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Peter,

Please take this patch as now for example X11 drivers are not
installed for the target. There are also various other problems
without this patch.

Paulius
