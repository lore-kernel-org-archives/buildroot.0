From: Andrew Pilloud <andrewpilloud@igneoussystems.com>
Date: Wed, 16 Aug 2017 14:42:04 -0700
Subject: [Buildroot] [PATCH 1/1] support/script/check-bin-arch: ignore
 /usr/lib/grub
In-Reply-To: <20170816232738.69c2c142@windsurf>
References: <20170816173935.2361-1-andrewpilloud@igneoussystems.com>
 <20170816232738.69c2c142@windsurf>
Message-ID: <4ff5a5e7-a7bd-c4e2-9dcb-a2953f2f3790@igneoussystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/16/2017 02:27 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 16 Aug 2017 10:39:35 -0700, Andrew Pilloud wrote:
>> /usr/lib/grub may contain binaries for the grub bootloader. These
>> ELF binaries may be for other platforms.
>>
>> Signed-off-by: Andrew Pilloud <andrewpilloud@igneoussystems.com>
> I've built both grub and grub2, and I don't get anything installed
> in /usr/lib/grub. Could you give more details on how you get binaries
> installed in /usr/lib/grub ?
>
> Thanks!
>
> Thomas
The grub2 package that ships with buildroot does not install the grub2 
tools or modules in the target. I have a version of the grub2 package 
that does install the tools and modules in the target in my EXTERNAL 
tree. (I could submit a patch to make that an option on the grub2 
package that ships with buildroot.) As best as I can tell, there is no 
way for a package to request specific files or folders be exempt from 
this check. There also doesn't appear to be a way to disable the test.

Suggestions?

Andrew
