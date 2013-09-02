From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Sep 2013 17:55:07 +0200
Subject: [Buildroot] [PATCH 3/3] python-pyzmq: new package
In-Reply-To: <CAAXf6LW=8rf6ScMS0t95f2cDWT4sLxYnMZAnzCYoEQzPVtkKGA@mail.gmail.com>
References: <1378071216-19697-1-git-send-email-rommel@layer-7.net>
 <1378071216-19697-3-git-send-email-rommel@layer-7.net>
 <CAAXf6LW=8rf6ScMS0t95f2cDWT4sLxYnMZAnzCYoEQzPVtkKGA@mail.gmail.com>
Message-ID: <5224B4DB.6060903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/13 10:24, Thomas De Schampheleire wrote:
[snip]
>  > +define PYTHON_PYZMQ_INSTALL_TARGET_CMDS
>  > +       (cd $(@D); $(PYTHON_PYZMQ_PARAMS) \
>  > +               $(HOST_DIR)/usr/bin/python setup.py install \
>  > +               --prefix=$(TARGET_DIR)/usr)
>  > +endef
>
> Since you're using $(HOST_DIR)/usr/bin/python here, there is a dependency
> on host-python which is not explicitly expressed. Since python itself
> already depends on host-python (see package/python/python.mk
> <http://python.mk>), the dependency is implicitly satisfied.
> I check and there are some python packages that do explicitly depend on
> host-python, while others do not. It seems there is no clear strategy for
> this yet. Ideally, these things should be lined up. My view would be to
> add the explicit dependency, if the .mk file explicitly references the
> host python binary, but this may not be the view of others.

  I agree that dependencies that are specific to the package itself 
should be explicit, even if they are also implicit. Not just for things 
explicitly mentioned in the .mk file, but also e.g. for packages that are 
checked for in the configure script.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
