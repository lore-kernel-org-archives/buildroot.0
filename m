From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 14 May 2013 17:27:39 +0200
Subject: [Buildroot] [PATCH] Standardisation of $(BUILD)/.root name
In-Reply-To: <20130514170721.622fc086@skate>
References: <50FACA8F.1040503@mind.be>
 <1368541851-31089-1-git-send-email-jezz@sysmic.org>
 <20130514170721.622fc086@skate>
Message-ID: <2999958.1S5Q3eWKd9@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 14 May 2013 17:07:21 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Tue, 14 May 2013 16:30:50 +0200, J?r?me Pouiller wrote:
> > -$(BUILD_DIR)/.root:
> > 
> > +$(STAMP_DIR)/skeleton-target-installed:
> >  	mkdir -p $(TARGET_DIR)
> >  	rsync -a \
> >  	
> >  		--exclude .empty --exclude .svn --exclude .git \
> >  		--exclude .hg --exclude=CVS --exclude '*~' \
> >  		$(TARGET_SKELETON)/ $(TARGET_DIR)/
> >  	
> >  	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
> > 
> > +	mkdir -p $(STAMP_DIR)
> > 
> >  	touch $@
> 
> I'm generally ok with the idea, but I don't like this mkdir. There is
> already a mkdir that creates the stamp file directory, in the main
> Makefile.
I also dislike this mkdir. My problem is to be sure $(STAMP_DIR) is created 
before $(STAMP_DIR)/skeleton-target-installed. 

I can change order of dependencies in dirs target but this solution is too 
fragile.

I cannot just add a dependency between $(STAMP_DIR)/skeleton-target-installed 
and  $(STAMP_DIR).

I can add a stampfile for $(STAMP_DIR) but it looks a little complicated. 

I can also use an intermediate phony target (like dirs target) but it also 
looks complicated.


Any better idea?

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
