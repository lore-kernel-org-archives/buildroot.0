From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 16 Dec 2013 10:02:49 -0600
Subject: [Buildroot] [PATCH v3 2/2] manual: update for multiple global
 patch dirs
In-Reply-To: <OF2FA8E811.C335DBDC-ON86257C42.006D5F8D-86257C42.006DF537@rockwellcollins.com>
References: <1386929361-21376-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1386929361-21376-2-git-send-email-rjbarnet@rockwellcollins.com>
 <52AB41BA.3070200@mind.be>
 <OF2FA8E811.C335DBDC-ON86257C42.006D5F8D-86257C42.006DF537@rockwellcollins.com>
Message-ID: <OF1E64C9A4.95C647E0-ON86257C43.0051E57B-86257C43.005825D7@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All

Ryan Barnett <rjbarnet@rockwellcollins.com> wrote on 12/15/2013 02:01:02 
PM:

> Arnout Vandecappelle <arnout@mind.be> wrote on 12/13/2013 11:19:54 AM:

[...]

>>   Actually, BR2_LINUX_KERNEL_PATCH also supports downloading the patch, 

>> which is not possible with BR2_GLOBAL_PATCH_DIR. As to the others, I 
>> think these options should just be removed (not deprecated, but really 
>> removed, with a clear explanation in Config.in.legacy). And in that 
case 
>> this paragraph becomes redundant.
> 
> I will make note of the BR2_LINUX_KERNEL_PATCH supporting the 
downloading 
> of the patch and that is the only way that it should be used. However, I 

> would rather submit a separate patch series to deprecate the other 
> options. Is this OK with you?
 
I was taking a look at the BR2_LINUX_KERNEL_PATCH option and it appears 
that these patches are applied as a post hook in the patching step. Since 
the advantage with this option is that it supports downloading the patch, 
then I believe you would want these patches to be applied before any user 
patches that would be BR2_GLOBAL_PATCH_DIR. The best example I think of 
for using both BR2_LINUX_KERNEL_PATCH and BR2_GLOBAL_PATCH_DIR is with the 
RT patch. In the RT case, you would want the RT patch to be applied before 
the BR2_GLOBAL_PATCH_DIR.

Would it be acceptable with the patch set to deprecate the option package 
PATCH_DIR options, to make BR2_LINUX_KERNEL_PATCH a pre hook instead of a 
post hook?

Thanks,
-Ryan

[...]
