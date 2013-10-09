From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 13:51:13 +0200
Subject: [Buildroot] [PATCHv3 03/20] package: add a
 <pkg>_EXTRA_DOWNLOADS variable
In-Reply-To: <87siwa4wtd.fsf@dell.be.48ers.dk>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87wqln4ffj.fsf@dell.be.48ers.dk> <20131008235537.102caeda@skate>
 <87siwa4wtd.fsf@dell.be.48ers.dk>
Message-ID: <20131009135113.34da6eca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 09 Oct 2013 11:29:02 +0200, Peter Korsgaard wrote:

>  Thomas> This has been discussed in a prior version of this patch set. The
>  Thomas> problem is that <pkg>_SOURCE is not only about downloading, but also
>  Thomas> about extracting.
> 
>  Thomas> So, what would <pkg>_SOURCE do? Download all the files listed,
>  Thomas> but extract only the first one? This seems like a weird
>  Thomas> semantic. I think I prefer the following clear semantic:
> 
>  Thomas>  <pkg>_SOURCE is one file, that gets downloaded and then extracted into
>  Thomas>  the source directory of the package.
> 
>  Thomas>  <pkg>_PATCH is a list of files or URLs, that get downloaded and apply
>  Thomas>  as patches into the source directory
> 
>  Thomas>  <pkg>_EXTRA_DOWNLOADS is a list of files that get downloaded,
>  Thomas>  and nothing else. The package is responsible for doing
>  Thomas>  something with them.
> 
> Well, I don't feel strongly about it, but no matter what we do packages
> with multple sources will be "special" (Luckily they are very uncommon),
> so you always have to do something explicit to use (extract) the extra
> sources.

Sure.

> But I don't particulary find a special _EXTRA_DOWNLOADS any cleaner than
> just saying that only the first element in _SOURCE will be automatically
> extracted.

Well, I find it cleaner, but if you prefer to have it in _SOURCE, I can
certainly modify the patch to extend the semantic of _SOURCE instead.
Let me know what you decide so that I can respin the patch set if
needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
