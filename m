From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 20 Jul 2012 14:51:39 +0200
Subject: [Buildroot] [PATCH v3] lighttpd: use standard web root directory
In-Reply-To: <CAHt8ZCN8bh_yqEj5Nspkw7D_nZ=7UkChnFHNdbhZTiCQY77aEQ@mail.gmail.com>
References: <1342779436-3427-1-git-send-email-spdawson@gmail.com>
 <50094DD6.6080102@free-electrons.com>
 <CAHt8ZCN8bh_yqEj5Nspkw7D_nZ=7UkChnFHNdbhZTiCQY77aEQ@mail.gmail.com>
Message-ID: <5009545B.1090802@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

Le 20/07/2012 14:38, Simon Dawson a ?crit :
> On 20 July 2012 13:23, Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>>>  define LIGHTTPD_INSTALL_CONFIG
>>> -     mkdir -p $(TARGET_DIR)/etc/lighttpd
>>> -     mkdir -p $(TARGET_DIR)/etc/lighttpd/conf.d
>>> -     mkdir -p $(TARGET_DIR)/srv/www/htdocs
>>> +     $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/lighttpd/conf.d
>>> +     $(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www
>>
>> Why do you remove the mkdirs here ?
> 
> They are redundant, since install is called with the -d option for the
> directories in question. (/srv/www/htdocs is no longer used.)

Ok, my question was more about why you replaced them by install -d
actually, but mostly out of curiosity :)

>>>  define LIGHTTPD_UNINSTALL_TARGET_CMDS
>>> -     rm -f $(TARGET_DIR)/usr/sbin/lighttpd
>>> -     rm -f $(TARGET_DIR)/usr/sbin/lighttpd-angel
>>> -     rm -rf $(TARGET_DIR)/usr/lib/lighttpd
>>> +     $(RM) $(TARGET_DIR)/usr/sbin/lighttpd
>>> +     $(RM) $(TARGET_DIR)/usr/sbin/lighttpd-angel
>>> +     $(RM) -r $(TARGET_DIR)/usr/lib/lighttpd
>>>  endef
>>
>> Why do you drop the -f here ? Depending on the user's shell and its
>> configuration, rm might require the user to confirm this removal, which
>> is not the case with rm -f.
> 
> The $(RM) make variable includes the -f option.

Ok, didn't know that.
Then you can add my
Acked-By: Maxime Ripard <maxime.ripard@free-electrons.com>
To your next iteration with your signed-off-by in the patch.

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
