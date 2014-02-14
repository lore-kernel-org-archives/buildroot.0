From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Fri, 14 Feb 2014 13:11:58 -0700
Subject: [Buildroot] [PATCH V5 3/3] i.MX: use temp directory for
	Freescale self-extractors
In-Reply-To: <20140214190352.GA3428@free.fr>
References: <1392337580-16568-1-git-send-email-eric.nelson@boundarydevices.com>
 <1392337580-16568-4-git-send-email-eric.nelson@boundarydevices.com>
 <20140214190352.GA3428@free.fr>
Message-ID: <52FE788E.1020408@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Yann,

On 02/14/2014 12:03 PM, Yann E. MORIN wrote:
> Eric, All,
>
> On 2014-02-13 17:26 -0700, Eric Nelson spake thusly:
>> The Freescale packages imx-lib, libfslcodec, libfslparser, and libfslvpuwrap
>> are each bundled as self-extracting tar-balls that contain a shell script
>> and a EULA in their package headers.
>>
>> These self-extractors also contain a command to create the destination
>> directory using "mkdir" (no -p) prior to extraction.
>>
>> Since we want to place the output into the build directory, which has already
>> been created at the time of extraction, this causes a warning message
>> from "mkdir".
>>
>> This patch changes things so that each package is extracted first into a
>> sub-directory, and the content is moved into the eventual build directory.
>
> In fact, I was not clear in my previous reply: as your testing shows,
> and as Arnout suggested, we can well leave with this warning.
>

That works for me.

> So, to make it clear this time: I don;t think we should try to play it
> smart with this whole directory mess: the archives do extract in a
> properly-named directory, so lets just accept the little warning.
>
Cool.

I have contacted Freescale to see if we can at least get "mkdir -p" into
the next release, and hopefully also address the awk-wardness of
extracting the EULA.

> The changes introduced by this patch, although not too complex, are not
> trivial either.
>

Agreed. This is a lot of change for a couple of small warnings.

> I suggest we just drop this patch, unless Peter really wants it.
>

+1

> Sorry I was not explicit enough in my previous mail. Thank you for
> staying with us all along the journey! :-)

I'm glad to help.

Regards,


Eric
