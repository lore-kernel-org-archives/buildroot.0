From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 7 Mar 2015 13:20:31 +0100
Subject: [Buildroot] [PATCH 1/2] tcl: add support for static builds
In-Reply-To: <20150307111101.5c44cd2c@free-electrons.com>
References: <1425681022-16612-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150307111101.5c44cd2c@free-electrons.com>
Message-ID: <54FAED0F.8030804@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 07/03/15 11:11, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Fri, 6 Mar 2015 22:30:21 +0000, Vicente Olivert Riera wrote:
> 
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +# Do not build tclsh with dynamic loading support when building it
>> +# statically because it needs dlopen() and friends.
>> +TCL_CONF_OPTS += --disable-load
>> +HOST_TCL_CONF_OPTS += --disable-load
>> +# Also, build only the binaries and libraries and don't build the
>> +# 'packages' because they are shared objects which are intended to be
>> +# loaded dynamically.
>> +TCL_MAKE_OPTS = binaries libraries
>> +HOST_TCL_MAKE_OPTS = binaries libraries
>> +TCL_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-binaries install-libraries
>> +TCL_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-binaries
>> +HOST_TCL_INSTALL_OPTS = DESTDIR=$(STAGING_DIR) install-binaries install-libraries
>> +endif
> 
> BR2_STATIC_LIBS indicates that the *target* packages are built static
> only. Host packages continue to be built dynamically. So I believe all
> the HOST_* assignments in here are wrong.

Noted. I will fix that in the v2. Thanks!

--
Vincent

> Best regards,
> 
> Thomas
> 
