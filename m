From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Apr 2018 14:36:25 +0200
Subject: [Buildroot] [PATCH 1/1] libcurl: fix building against libressl
In-Reply-To: <c5a388fe-9d06-15b5-0bc1-a4bf23890b19@mind.be>
References: <20180413123931.7604-1-aduskett@gmail.com>
 <20180415204327.5bc05597@windsurf.numericable.fr>
 <c5a388fe-9d06-15b5-0bc1-a4bf23890b19@mind.be>
Message-ID: <20180417143625.17ceda76@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 13:41:08 +0200, Arnout Vandecappelle wrote:

> > I.e:
> > 
> > $ git clone https://github.com/curl/curl.git
> > $ cd curl/
> > $ git checkout curl-7_59_0
> > $ git cherry-pick 7c90c93c0b061da81f69fabdd57125b2783c15fb  
> 
>  Use git cherry-pick -x -s. This will add your Sob right away, and it will
> record the upstream commit from which it was taken.

Aah, didn't about -x, definitely useful!

> > $ git format-patch HEAD^  
> 
>  And here, of course, you need to add -N (well, not in this case since it's just
> a single patch, but in general).

Yes, but indeed since it was a single patch, I omitted the -N.

> > Could you rework your patch by doing this ? I could have done it
> > myself, but I preferred to explain the process for doing it properly :)  
> 
>  This should be added to the manual...

True. Honestly, I find our manual badly organized, and I never find
where things should be added. I'm not against writing documentation
(see my e-mail about the changes to the download infrastructure), but I
never find *where* to put those details into our manual.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
