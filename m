From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Apr 2017 22:03:25 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
In-Reply-To: <CANxTyt40oC9PknEk-r7uBOmgjAEGJd4tgpQ-6uYKDksoFYVBxw@mail.gmail.com>
References: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
 <4e5df153-6f58-8b65-faf4-f87fb91324cd@mind.be>
 <20170420092015.3b2f7fbd@free-electrons.com>
 <87pog3ypb1.fsf@dell.be.48ers.dk>
 <8b127902-0268-8307-70da-065362773da9@mind.be>
 <CANxTyt40oC9PknEk-r7uBOmgjAEGJd4tgpQ-6uYKDksoFYVBxw@mail.gmail.com>
Message-ID: <ea987c1a-ef7d-8531-c29a-d2b68c1292c7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-04-17 17:36, Danomi Manchego wrote:
> Arnout,
> 
> On Sun, Apr 23, 2017 at 4:55 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> 2. Make sure that busybox doesn't overwrite a tool that already exists. Needs to
>> be done for all the different ways that busybox can install things. Then the
>> order doesn't matter. Great solution, except for the bloatification. Also, it is
>> not great when you have FEATURE_INDIVIDUAL selected in busybox, because a
>> busybox-rebuild will not actually rebuild anything.
> 
> Does https://git.buildroot.net/buildroot/commit/?id=802bff9c42376078f28aa49d3eab630120940eb0
> not take care of overwriting tools that already exist?

 Hey, I missed that one! So, that means that the dependencies on busybox are in
fact redundant, right? So we could actually revert the busybox.mk part of
33c72344a? Yep, tried that, I'll send a patch.

 So in fact, we can remove all dependencies on busybox? That's nice!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
