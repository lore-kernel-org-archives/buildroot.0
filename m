From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 14:45:19 +0100
Subject: [Buildroot] Mysql: $(ENABLE_DEBUG) is unset
In-Reply-To: <CA+kK6WujspDnZ_nc_j=mbVopwbeqaM1B0_Noi2c6+2s9kQVMzw@mail.gmail.com>
References: <CA+kK6WsurjJPB1wzACqx1bNO1GYBRK+u1DAPZXfKCQoNVYiJEA@mail.gmail.com>
 <CA+kK6WujspDnZ_nc_j=mbVopwbeqaM1B0_Noi2c6+2s9kQVMzw@mail.gmail.com>
Message-ID: <52F0EEEF.5060205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/02/14 17:45, Marcelo Gutierrez wrote:
> Ther are two possible solution:
> 
> 1) Remove $(ENABLE_DEBUG) option
> 
> 2) Change Config.in: add option to compile MySQL with debug support

 We have a global BR2_ENABLE_DEBUG that should be used. It already
automatically --enable-debug to configure, but mysql calls it
--with-debug. So, the patch should remove $(ENABLE_DEBUG) and replace it
with something like

MYSQL_CONF_OPT += $(if $(BR2_ENABLE_DEBUG),--with-debug)

 Can you try this and post a patch if it works?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
