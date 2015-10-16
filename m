From: =?UTF-8?B?0JLQvtC70LrQvtCyINCS0Y/Rh9C10YHQu9Cw0LI=?= <sv99@inbox.ru>
Date: Fri, 16 Oct 2015 23:17:59 +0300
Subject: [Buildroot] =?utf-8?q?how_can_i_customize_existing_package_when_u?=
 =?utf-8?q?sing_the_BR2=5FEXTERNAL_mechanism?=
Message-ID: <1445026679.208938590@f90.i.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 for example, i need add rtmp module to the nginx package

nginx.mk

ifeq ($(BR2_PACKAGE_NGINX_HTTP_RTMP),y)
NGINX_POST_PATCH_CMDS += git clone  https://github.com/arut/nginx-rtmp-module.git $(@D)/rtmp
NGINX_CONF_OPT += --add-module=$(@D)/rtmp
endif

nginx/Config.in

config BR2_PACKAGE_NGINX_HTTP_RTMP
?? ?bool "Enable RTMP module"
?? ?depends on BR2_PACKAGE_NGINX
?? ?help
?? ?? Enable NGINX-based Media Streaming Server.

Volkov Viacheslav



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151016/4d00a1d1/attachment.html>
