From: Sebastian Frias <sf84@laposte.net>
Date: Tue, 26 Apr 2016 10:44:20 +0200
Subject: [Buildroot] [PATCH v2] linux: use $(LINUX_INSTALL_IMAGE_CMDS)
 instead of plain 'cp'
In-Reply-To: <20160425214332.58a41bd0@free-electrons.com>
References: <571E0683.4080306@laposte.net>	<20160425140615.11e86412@free-electrons.com>	<571E2F21.3040903@laposte.net>
 <20160425214332.58a41bd0@free-electrons.com>
Message-ID: <571F2A64.3000202@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 04/25/2016 09:43 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 25 Apr 2016 16:52:17 +0200, Sebastian Frias wrote:
>> The target "$(LINUX_DIR)/.stamp_initramfs_rebuilt" uses its own
>> 'cp' command, instead of LINUX_INSTALL_IMAGE/LINUX_INSTALL_IMAGES_CMDS
>> provided by (or updated with) commit 055e6162bba7 ("linux: don't build
>> appended DTB image in place and support multiple images") and thus is
>> not operating properly when APPENDED_DTB is used.
>>
>> Indeed, it copies a single image, and does not copy the one with the DTB
>> appended.
>>
>> This patch replaces the 'cp' command with LINUX_INSTALL_IMAGE which
>> handles APPENDED_DTB.
>>
>> Fixes: 055e6162bba7 ("linux: don't build appended DTB image in place and
>> support multiple images")
>>
>> Signed-off-by: Sebastian Frias <sf84@laposte.net>
>> ---
>> Changes v1 -> v2:
>>   - remove '-v' from cp (as suggested by thomas.petazzoni at free-electrons.com)
>>   - use LINUX_INSTALL_IMAGE instead of LINUX_INSTALL_IMAGES_CMDS (also suggested by thomas.petazzoni at free-electrons.com)
>> ---
>>  linux/linux.mk | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> The commit title was no longer matching what the commit was doing, so
> I've tweaked it, and applied your patch. Thanks!
> 

Oh, sorry about that (I had edited the patch manually), and thanks for fixing it! :-)

Best regards,

Sebastian
