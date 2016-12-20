From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Dec 2016 21:53:51 +0100
Subject: [Buildroot] [PATCH 1/1] uboot: fix custom patch dir legacy
 handling
In-Reply-To: <87tw9z7yw6.fsf@dell.be.48ers.dk>
References: <1482203412-5361-1-git-send-email-danomimanchego123@gmail.com>
 <87tw9z7yw6.fsf@dell.be.48ers.dk>
Message-ID: <06d55d32-6d74-0daa-8770-5b7e56deab81@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-12-16 10:06, Peter Korsgaard wrote:
>>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:
> 
>  > Commit 3e3fef39e71ed0426130b36aa00e4630ebb537ae added new and improved
>  > patch handling, with BR2_TARGET_UBOOT_PATCH.  This was in addition to
>  > the existing BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR option, that only
>  > handled directories.
> 
>  > Later, commit 21b25d28fc7af3bb1b2c55e4a46e0d067ebc0081 moved the old
>  > BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR to legacy options.  But on the way,
>  > bad things happened:
> 
>  > * The original option was a string, while the one added to Config.in.legacy
>  > is a bool.  This results in a warning from defconfigs that actually define
>  > the old BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR (because a string is not a valid
>  > value for a bool), but it does not result in the legacy option being
>  > selected.  Consequently, BR2_LEGACY is not selected either.
> 
>  > * The advice at the top of Config.in.legacy to add a hidden WRAP option
>  > to select BR2_LEGACY was not heeded.
> 
>  > * The advice at the top of Config.in.legacy to use the old string
>  > option as the default for the new string option was not heeded.  In
>  > this case, the variable was not just renamed, as the old option
>  > supported directories only, while the new one supports files too.
>  > But since the old option is a subset of the new option, it can still
>  > be used to set a useful default.
> 
>  > So, this mod turns the legacy option back to a string, adds a hidden
>  > bool WRAP option to set BR2_LEGACY when the string is non emoty, and
>  > uses the legacy option to set the default for the new option.
> 
>  > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> 
> Nice detailed description! Committed, thanks.

 This is 2016.11.x material.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
