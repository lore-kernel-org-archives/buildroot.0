From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 12 Feb 2014 16:53:36 -0700
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <52FBFBD6.1070609@boundarydevices.com>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212190351.GD17804@free.fr> <52FBC72D.3090706@boundarydevices.com>
 <52FBD772.40900@boundarydevices.com> <52FBEE79.9070901@mind.be>
 <20140212161518.75ac8839@core2quad.morethan.org>
 <52FBFBD6.1070609@boundarydevices.com>
Message-ID: <52FC0980.8010003@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,

On 02/12/2014 03:55 PM, Eric Nelson wrote:
> Thanks Mike,
>
> On 02/12/2014 03:15 PM, Mike Zick wrote:
>> On Wed, 12 Feb 2014 22:58:17 +0100
>> Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>>> It appears that the directory is created by the bit of
>>>> structure using IMX_LIB_EXTRACT_CMDS, and the warning
>>>> message is from a 'mkdir' embedded within the self-extracting
>>>> package.
>>>>
>>>> I could 'rm' the directory inside IMX_LIB_EXTRACT_CMDS,
>>>> but it's not clear that this is the right thing to do.
>>>
>>>   The directory exists already because the buildroot infrastructure
>>> creates some stamp files in it - e.g. .stamp-downloaded. So if you'd
>>> remove the directory, the download will be retried...
>>>
>>>   Therefore, I think we should just live with the warning.
>>>
>>
>> Perhaps alias "mkdir" to "mkdir -p" for the duration of the commands?
>>
>
> I like it, although I'm not certain whether that will break
> on arcane shells.
>

This is beyond me...

I can't figure out how to get an alias to be effective in the middle of
this:

(cd $(BUILD_DIR); \
	sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)

Regards,


Eric
