From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Mar 2016 19:14:21 -0300
Subject: [Buildroot] [PATCH 1/2] norm: new package
In-Reply-To: <8737rr8km2.fsf@dell.be.48ers.dk>
References: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
 <8737rr8km2.fsf@dell.be.48ers.dk>
Message-ID: <56E8893D.8000505@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/03/16 19:03, Peter Korsgaard wrote:


> The package looks good - But waf is a python script, right? It got me
> wondering if we should use our host-python or if we can rely on the
> build host having all dependencies?
>
> It seems like we have a mix:
>
> package/glmark2/glmark2.mk:             $(HOST_DIR)/usr/bin/python2 ./waf configure $(GLMARK2_CONF_OPTS) \
> package/glmark2/glmark2.mk:     cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf
> package/glmark2/glmark2.mk:     cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf install --destdir=$(TARGET_DIR)
> package/gstreamer1/gst1-imx/gst1-imx.mk:                $(HOST_DIR)/usr/bin/python2 ./waf configure $(GST1_IMX_CONF_OPTS)
> package/gstreamer1/gst1-imx/gst1-imx.mk:                $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
> package/gstreamer1/gst1-imx/gst1-imx.mk:                $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
> package/jack2/jack2.mk:         $(HOST_DIR)/usr/bin/python2 ./waf configure \
> package/jack2/jack2.mk: (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
> package/jack2/jack2.mk: (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
> package/jack2/jack2.mk: (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) \
> package/libimxvpuapi/libimxvpuapi.mk:   $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python2 ./waf configure \
> package/libimxvpuapi/libimxvpuapi.mk:   $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
> package/libimxvpuapi/libimxvpuapi.mk:   $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) install
> package/libimxvpuapi/libimxvpuapi.mk:   $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install
> package/samba4/samba4.mk:               ./buildtools/bin/waf configure \
>
> E.G. everything else than samba4 uses host-python2.

Hi Peter.
I can't speak for all the rest, but norm uses waf 1.8.11 (I.E. 1.8.x 
series) which works fine with python2 or python3, so as long as there's 
one host python (at least 2.5) everything should be fine (covered by the 
prereqs, and waf is pretty much self-contained).
Regards.
