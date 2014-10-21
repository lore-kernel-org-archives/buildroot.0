From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Oct 2014 14:06:03 -0300
Subject: [Buildroot] [PATCH] iptables: disable static for dynamic builds
In-Reply-To: <20141021190227.05483ab6@free-electrons.com>
References: <1413910694-21496-1-git-send-email-gustavo@zacarias.com.ar>
 <20141021190227.05483ab6@free-electrons.com>
Message-ID: <5446927B.90908@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/21/2014 02:02 PM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Tue, 21 Oct 2014 13:58:14 -0300, Gustavo Zacarias wrote:
> 
>> +# Building static causes ugly warnings on some plugins
>> +IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
>> +	$(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
> 
> Quick related question: does iptables work properly for purely static
> builds?

I haven't tried in a while, but probably yes, since the effect of both
enables was quite similar, otherwise normally extensions live in
/usr/lib/xtables/* as dynamic objects (where you can add new ones, which
is what xtables-addons does besides adding new kernel modules, with the
scenario right now being every extension linked into the iptables
/usr/sbin/xtables-multi binary).
Regards.
