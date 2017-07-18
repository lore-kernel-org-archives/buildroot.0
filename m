From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jul 2017 21:38:39 +0200
Subject: [Buildroot] [PATCH 02/15] libwebsockets: support libressl
In-Reply-To: <CAFSsvmr2fwckB=5L01NEo8mtxz6PCww7eptYULmA0rQ-yXX5oQ@mail.gmail.com>
References: <20170714181537.17479-1-aduskett@gmail.com>
 <20170714181537.17479-2-aduskett@gmail.com>
 <20170715000852.6a2f8105@windsurf>
 <CAFSsvmr2fwckB=5L01NEo8mtxz6PCww7eptYULmA0rQ-yXX5oQ@mail.gmail.com>
Message-ID: <2977a944-fe19-e3e8-df28-56de74b14182@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-07-17 19:32, Adam Duskett wrote:
> Hello;
> 
> On Fri, Jul 14, 2017 at 6:08 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Fri, 14 Jul 2017 14:15:24 -0400, Adam Duskett wrote:
>>
>>> +else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
>>> +LIBWEBSOCKETS_DEPENDENCIES += libressl host-openssl
>>> +LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
>>
>> I'm wondering: do we want to mix using libressl on the target, and
>> openssl on the host?
>>
>> I don't necessarily see a big problem with this, but I'm just
>> wondering, since it might be a bit confusing.
>>
> I know you asked Arnout, but I wanted to throw my two cents in here
> as well.
> 
> If I make libressl a host package, Libwebsockets compiles and works
> just fine with it.  I would personally like to make libressl a host package as
> well.

 Sounds good to me. If libressl ever becomes a virtual package, it will go that
route anyway.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
