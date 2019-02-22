From: Andreas Naumann <dev@andin.de>
Date: Fri, 22 Feb 2019 17:18:51 +0100
Subject: [Buildroot] [PATCH v7 0/8] Top-level parallel build support
In-Reply-To: <20181228182159.02a8a6c4@windsurf>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228182159.02a8a6c4@windsurf>
Message-ID: <1e8db4c8-8bd4-d47a-ae39-a2d461a49672@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

finally I found some time to try this v7 on top of 2019.02-rc1.

Am 28.12.18 um 18:21 schrieb Thomas Petazzoni:
> Hello,
> 
> On Fri, 28 Dec 2018 11:43:27 +0100, Thomas Petazzoni wrote:
> 
>> Here is a seventh iteration of the per-package SDK and target
>> directory implementation, offering top-level parallel build
>> capability.
> 
> Regarding top-level parallel build, I prepared this Wiki page that
> documents the progress of the effort:
> 
>    https://elinux.org/Buildroot:Top_Level_Parallel_Build
> 

My update to the known remaining issues is:
1. I no longer see the ccache problem for the kconfig packages
(uboot+linux)

2. the package-file-list problem has become a blocker since commit
3c8f0d9 core/pkg-infra: restore completeness of packages files lists
with failures like

comm: /home/jenkins/.../build/.files-list-staging.new: No such file or 
directory

Would it be an idea to write the statistics per package :-) inside the 
package build folder and assemble them into one file only once all 
packages are built?

best regards,
Andreas




PS. Actually I just tried flock, which looks promising. If it works I'll 
send a patch next week.

> Especially, I'd like to make it clear: this patch series is only the
> *core* support for per-package directories. There are a number of fixes
> needed for Meson, Python and more to make it usable with some packages.
> I wanted to keep this patch series reasonable in size by only
> submitting the core support.
> 
> If you want to do some testing, please use
> https://git.bootlin.com/users/thomas-petazzoni/buildroot/log/?h=ppsh-v7-work
> which has all the fixes I currently have.
> 
> Best regards,
> 
> Thomas
> 
