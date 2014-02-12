From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 12 Feb 2014 15:45:16 -0700
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <87a9dwq8hb.fsf@dell.be.48ers.dk>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>	<1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>	<20140212190351.GD17804@free.fr>	<52FBC72D.3090706@boundarydevices.com>	<52FBD772.40900@boundarydevices.com>
 <52FBEE79.9070901@mind.be> <87a9dwq8hb.fsf@dell.be.48ers.dk>
Message-ID: <52FBF97C.9040901@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Peter (and Arnout),

On 02/12/2014 03:20 PM, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>   >> I could 'rm' the directory inside IMX_LIB_EXTRACT_CMDS,
>   >> but it's not clear that this is the right thing to do.
>
>   >  The directory exists already because the buildroot infrastructure
>   > creates some stamp files in it - e.g. .stamp-downloaded. So if you'd
>   > remove the directory, the download will be retried...
>
>   >  Therefore, I think we should just live with the warning.
>
> Agreed. Alternatively, patch the extracter to use mkdir -p (but I don't
> know if that is doable).
>

You made me flinch!

I thought of that (patching the extractor), and it is doable, but 
there's just something wrong with manipulating sources after
download. You lose the ability to compare hashes, et cetera...

We could copy and then patch, but the GPU code is **big**,
so this would be slow.

My other thought was to use "| 2>/dev/null", but that seems
equally evil, so I think I'll just send V5 with the warning.

Unless... you think pre-empting the warning with another
message is warranted:

	echo "** You're about to see a warning that you can ignore "

Regards,


Eric
