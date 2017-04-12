From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Apr 2017 12:55:03 +0200
Subject: [Buildroot] [PATCH 01/53] pkg-rebar: remove redundant / in
 front of $($(PKG)_ERLANG_LIBDIR)
In-Reply-To: <20170412114632.3ea39fdb@free-electrons.com>
References: <20170412093928.1006-1-arnout@mind.be>
 <20170412093928.1006-2-arnout@mind.be>
 <20170412114632.3ea39fdb@free-electrons.com>
Message-ID: <fc690f48-a6c0-a203-b846-91f147ec17dd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-04-17 11:46, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 12 Apr 2017 11:38:35 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>>  define install-erlang-directories
>> -	$(INSTALL) -d $(1)/$($(PKG)_ERLANG_LIBDIR)
>> +	$(INSTALL) -d $(1)$($(PKG)_ERLANG_LIBDIR)
> 
> This looks a bit weird to me. Wouldn't it make more sense to have
> ERLANG_LIBDIR not start with a / ?

 Well...

1. it doesn't look weird to me;

2. in one place, it was already like that;

3. if we change it, we should also change all instances of _ERLANG_LIBDIR in all
packages, including external trees.

 The last point isn't that important though since it still works even if the /
is there. And we don't have any in-tree package that sets _ERLANG_LIBDIR.

 Anyway, the patch is independent of the rest of the series (I should have left
it out, probably). So don't let it stop you :-)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
