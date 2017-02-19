From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Feb 2017 20:41:01 -0300
Subject: [Buildroot] [PATCH 5/9] check-package: check *.patch files
References: <20170207105850.57f5df89@free-electrons.com>
Message-ID: <58aa2d0d301b8_37663ff65c38c268418b4@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire,
Thomas Petazzoni,

On Tue, Feb 07, 2017 at 07:58 AM, Thomas Petazzoni wrote:

> On Tue, 24 Jan 2017 22:21:31 +0100, Thomas De Schampheleire wrote:
> 
>> > +NUMBERED_PATCH = re.compile("Subject:\s*\[PATCH\s*\d+/\d+\]")  
>> 
>> Is this really a requirement? This numbering in the patch header is
>> unrelated to the number used in the filename. One can expect many
>> 'PATCH 1/1' in the same package directory. I would leave out this
>> test.
> 
> We normally require patches in package/<foo>/ to be generated with "git
> format-patch -N", so that their prefix is [PATCH] and not [PATCH x/y].
> 
> However, we do not require all patches to be Git formatted. It's kind
> of required when the upstream project uses Git as its version control
> system. But when the upstream project uses some other version control
> system, other patch formats are excepted, like hand-generated patches
> with "diff", or patches generated with "quilt". Not everyone wants to
> find with Mercurial to find out to generate a patch with this damn
> thing :-)

I fixed the code to generate a warning only when the patch was generated
using git (by testing if any line starts with 'diff --git').

I let to you to decide to keep or remove it.
Removing this check NumberedSubject when applying should be easy in v2.

Regards,
Ricardo
