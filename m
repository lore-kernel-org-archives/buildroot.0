From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 14 Oct 2015 15:16:26 +0100
Subject: [Buildroot] [PATCH] mplayer: needs zlib
In-Reply-To: <561E6215.1000201@zacarias.com.ar>
References: <1444730313-34190-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151013225708.3aa5e0aa@free-electrons.com>
 <561E5F04.9020607@zacarias.com.ar> <561E6193.1030208@imgtec.com>
 <561E6215.1000201@zacarias.com.ar>
Message-ID: <561E63BA.10302@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Done. I haven't made a v2 because is a totally different patch:

http://patchwork.ozlabs.org/patch/530210/

Regards,

Vincent.

On 10/14/2015 03:09 PM, Gustavo Zacarias wrote:
> On 14/10/15 11:07, Vicente Olivert Riera wrote:
> 
>> and why not disable apng and tdsc unconditionally? As you said, "these
>> formats are unlikely to normally be used via mplayer", so if someone
>> needs support for them, a future patch could do the work.
>>
>> Regards,
>>
>> Vincent.
> 
> Hi Vincent.
> Well, you could just do:
> 
> ifeq ($(BR2_PACKAGE_ZLIB),y)
> MPLAYER_DEPENDENCIES += zlib
> else
> MPLAYER_CONF_OPTS += --disable-decoder=apng --disable-encoder=apng
> --disable-decoder=tdsc
> endif
> 
> Can't you?
> Regards.
