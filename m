From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 26 Nov 2016 17:00:03 +0100
Subject: [Buildroot] [PATCH v4 13/18] python2: generate reproducible .pyc
In-Reply-To: <7d9c3a88-ce81-fb52-9200-5380ad818f79@mind.be>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
 <20161123230539.4762ebcd@free-electrons.com>
 <7d9c3a88-ce81-fb52-9200-5380ad818f79@mind.be>
Message-ID: <2984086.77TjFLAjTf@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thursday 24 November 2016 20:06:55 Arnout Vandecappelle wrote:
[...]
> >>  	$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
> >> -		support/scripts/pycompile.py \
> >> +		support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \
> > 
> > Why do we need to force?
Pycompile rely on .py modification times to know if a file need to be
recompiled. Since reproducible builds tweak modification time, it is
safer to force recompilation of all source files.

(I will add this explanation to commit log)

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
