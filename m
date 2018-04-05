From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Apr 2018 08:35:55 +0200
Subject: [Buildroot] [PATCH] pkg-download.mk: do not add a trailing
 slash to <PKG>_SITE
In-Reply-To: <45c0681b-d3a9-99b0-555b-9dd3d6e305ff@mind.be> (Arnout
 Vandecappelle's message of "Thu, 5 Apr 2018 00:33:03 +0200")
References: <20180404063051.12111-1-peter@korsgaard.com>
 <878ta3o4nk.fsf@dell.be.48ers.dk>
 <45c0681b-d3a9-99b0-555b-9dd3d6e305ff@mind.be>
Message-ID: <87vad6ma7o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> >  ifeq ($(BR2_PRIMARY_SITE_ONLY),)
 >> >  DOWNLOAD_URIS += \
 >> > -	-u $($(PKG)_SITE_METHOD)+$(dir $(call qstrip,$(1)))
 >> > +	-u $($(PKG)_SITE_METHOD)+$(patsubst %/,%,$(dir $(call qstrip,$(1))))
 >> 
 >> Alternatively I *THINK* we can just use $($(PKG)_SITE) here.

 >  No, the <PKG>_PATCH and <PKG>_EXTRA_DOWNLOADS variables may contain full URLs.

Ahh, yes. It did seem too easy ;)

I'll add a note about this and commit, thanks.

-- 
Bye, Peter Korsgaard
