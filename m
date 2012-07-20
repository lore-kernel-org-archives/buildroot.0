From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 20 Jul 2012 13:38:30 +0100
Subject: [Buildroot] [PATCH v3] lighttpd: use standard web root directory
In-Reply-To: <50094DD6.6080102@free-electrons.com>
References: <1342779436-3427-1-git-send-email-spdawson@gmail.com>
 <50094DD6.6080102@free-electrons.com>
Message-ID: <CAHt8ZCN8bh_yqEj5Nspkw7D_nZ=7UkChnFHNdbhZTiCQY77aEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On 20 July 2012 13:23, Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
> Since you are modifying this patch, could you add your signed-off-by as
> well ?

Yes, I'll fix this and resubmit.

>>  define LIGHTTPD_INSTALL_CONFIG
>> -     mkdir -p $(TARGET_DIR)/etc/lighttpd
>> -     mkdir -p $(TARGET_DIR)/etc/lighttpd/conf.d
>> -     mkdir -p $(TARGET_DIR)/srv/www/htdocs
>> +     $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/lighttpd/conf.d
>> +     $(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www
>
> Why do you remove the mkdirs here ?

They are redundant, since install is called with the -d option for the
directories in question. (/srv/www/htdocs is no longer used.)

>>  define LIGHTTPD_UNINSTALL_TARGET_CMDS
>> -     rm -f $(TARGET_DIR)/usr/sbin/lighttpd
>> -     rm -f $(TARGET_DIR)/usr/sbin/lighttpd-angel
>> -     rm -rf $(TARGET_DIR)/usr/lib/lighttpd
>> +     $(RM) $(TARGET_DIR)/usr/sbin/lighttpd
>> +     $(RM) $(TARGET_DIR)/usr/sbin/lighttpd-angel
>> +     $(RM) -r $(TARGET_DIR)/usr/lib/lighttpd
>>  endef
>
> Why do you drop the -f here ? Depending on the user's shell and its
> configuration, rm might require the user to confirm this removal, which
> is not the case with rm -f.

The $(RM) make variable includes the -f option.

Thanks for the feedback,

Simon.
