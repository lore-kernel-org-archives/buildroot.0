From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 03 May 2013 17:06:51 -0300
Subject: [Buildroot] [PATCH] jquery-keyboard: new package
In-Reply-To: <518414F9.4030506@mind.be>
References: <1367582973-20541-1-git-send-email-gustavo@zacarias.com.ar>
 <518414F9.4030506@mind.be>
Message-ID: <518418DB.9010709@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/2013 04:50 PM, Arnout Vandecappelle wrote:
>> +JQUERY_KEYBOARD_LICENSE_FILES = README.markdown
> 
>  That file does nothing more than refer to the websites with the license
> text... Not sure how to deal with that.

I usually do it to avoid license-hunting, the details are stated there,
i wouldn't consider it out of place to include it.
Call it for lazy people who can't google "WTFPL", and it also details
what's covered by each license and a little exception in line 70 of that
file.

>> +
>> +define JQUERY_KEYBOARD_INSTALL_TARGET_CMDS
>> +    $(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/css
> 
>  With the -D arguments below, the line above is redundant.
> 

Oops true, copy/paste overdone.

>> +    $(INSTALL) -m 0644 -D $(@D)/css/keyboard.css \
>> +        $(TARGET_DIR)/var/www/css/keyboard.css
>> +    $(INSTALL) -m 0644 -D $(@D)/js/jquery.keyboard*.js \
>> +        $(TARGET_DIR)/var/www
>> +    $(INSTALL) -m 0644 -D $(@D)/js/jquery.mousewheel.js \
>> +        $(TARGET_DIR)/var/www/jquery.mousewheel.js
>> +    $(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/layouts
>> +    $(INSTALL) -m 0644 -D $(@D)/layouts/*.js \
>> +        $(TARGET_DIR)/var/www/layouts
> 
>  But why not just cp -r $(@D)/{css,js,layouts} $(TARGET_DIR)/var/www ?

I usually prefer to be quite explicit with dir/file modes.
Regards.
