From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 23:59:45 +0200
Subject: [Buildroot] [PATCH] pkg-cmaketargets.mk: do not hardcode
 absolute path in toolchainfile.cmake
In-Reply-To: <531429C3.80801@mind.be>
References: <1393694162-21952-1-git-send-email-s.martin49@gmail.com>
 <531429C3.80801@mind.be>
Message-ID: <20140419235945.0601cc38@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Mon, 03 Mar 2014 08:05:39 +0100, Arnout Vandecappelle wrote:

> >  $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
> >  	@mkdir -p $(@D)
> >  	@echo -en "\
> > +	get_filename_component(_HOST_DIR \$${CMAKE_CURRENT_LIST_FILE} PATH)\n\
> > +	set(_HOST_DIR \"\$${_HOST_DIR}/../../..\")\n\
> >  	set(CMAKE_SYSTEM_NAME Linux)\n\
> > -	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
> > -	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
> > +	set(CMAKE_C_COMPILER \"\$${_HOST_DIR}/$(subst $(HOST_DIR)/,,$(TARGET_CROSS))gcc\")\n\
> 
>  Wouldn't it be more natural to write
> 
> set(CMAKE_C_COMPILER \"$(subst $(HOST_DIR)/,\$${_HOST_DIR}/,$(TARGET_CC_NOCCACHE)\")\n\
> 
> ?

Can you reply to Arnout comment, and/or resend an updated version of
this patch? Or take some other action about it?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
