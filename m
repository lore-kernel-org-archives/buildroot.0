From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Mar 2012 11:27:28 -0300
Subject: [Buildroot] [PATCH 19/20] alsa-lib: bump to version 1.0.25
In-Reply-To: <201203140036.06296.arnout@mind.be>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <1331502489-5036-19-git-send-email-gustavo@zacarias.com.ar>
 <201203140036.06296.arnout@mind.be>
Message-ID: <8c3170de9fb1bda123918b309ed38fdf@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-13 20:36, Arnout Vandecappelle wrote:

>> +# Can't build with static & shared at the same time (1.0.25+)
>> +ifneq ($(BR2_PREFER_STATIC),y)
>> +ALSA_LIB_CONF_OPT += --enable-static=no
>> +else
>> +ALSA_LIB_CONF_OPT += --enable-shared=no
>> +endif
>
>  Shouldn't we put this in AUTOTARGETS?  Or at least the
> --enable-shared=no if BR2_PREFER_STATIC?
>
>  Regards,
>  Arnout

We could try, though i expect some trouble to arise, for example the 
new dnsmasq with lua support only links against static liblua.
There are probably others that have a flaky build system.
Regards.
