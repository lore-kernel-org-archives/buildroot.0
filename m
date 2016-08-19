From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 16:48:00 +0200
Subject: [Buildroot] [PATCH 2/2] python-pyqt5: new package
In-Reply-To: <4a764858506ee90fcb41d57d252e5864@manuel-voegele.de>
References: <20160819134225.1490-1-develop@manuel-voegele.de>
 <20160819134225.1490-3-develop@manuel-voegele.de>
 <20160819160705.545443ac@free-electrons.com>
 <4a764858506ee90fcb41d57d252e5864@manuel-voegele.de>
Message-ID: <20160819164800.68305618@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 16:40:05 +0200, Manuel V?gele wrote:

> > Since I guess PyQt5 is managed in Git upstream, I would very much
> > prefer a Git formatted patch if possible. Of course, if Git is not used
> > upstream, then it's fine.  
> 
> I didn't manage to find any official PyQt repository. But if it exists I 
> suppose it would be a Mercurial repo since all the other Riverbank 
> projects use Mercurial too.

OK. Then the patch format is OK as-is.

> >> +# Since we can't run generate qtdetail.out by running qtdetail on 
> >> target device
> >> +# we must generate the configuration.
> >> +define PYTHON_PYQT5_GENERATE_QTDETAIL
> >> +	$(RM) -f $(1)/qtdetail.out
> >> +	$(call PYTHON_PYQT5_QTDETAIL,$(PYTHON_PYQT5_QTDETAIL_LICENSE),$(1))
> >> +	$(call PYTHON_PYQT5_QTDETAIL,$(PYTHON_PYQT5_QTDETAIL_TYPE),$(1))
> >> +	$(foreach f,$(PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES),
> >> +		$(call PYTHON_PYQT5_QTDETAIL,$(f),$(1)) \
> >> +	)
> >> +endef  
> > 
> > So this is all exactly the same as PyQt4 ?  
> It's not all the same - I already removed some switches which aren't 
> required in PyQt5. But I'm gonna recheck if I can remove even more.

OK.

> > Can you test after removing this compileall line? Indeed, we are now
> > byte-compiling all Python modules globally. If it works, a patch
> > removing this line for python-pyqt.mk would be good to have.  
> 
> I'm gonna do that.

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
