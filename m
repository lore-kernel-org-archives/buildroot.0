From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 18 Oct 2011 10:55:20 -0500
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <20111018163202.504d5069@skate>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <20111018163202.504d5069@skate>
Message-ID: <201110181055.22743.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue October 18 2011, Thomas Petazzoni wrote:
> Le Tue, 18 Oct 2011 11:14:54 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
> 
> > +	if test -n "$(3)" ; then \
> > +		case "$($(PKG)_SITE_METHOD)" in \
> > +			git) exit ;; \
> > +			svn) exit ;; \
> > +			bzr) exit ;; \
> > +			file) exit ;; \
> 

How about just a nop?
s/exit/:/

Mike

> I don't think you want to exit here, you want to continue to evaluate
> the BR2_BACKUP_SITE solution below. For example, sources.buildroot.net
> has http://sources.buildroot.net/libsvgtiny-12121.tar.gz, which is the
> Subversion tarball of libsvgtiny. Same for
> http://sources.buildroot.net/tslib-412d99d8b92c.tar.gz.
> 
> Regards,
> 
> Thomas
