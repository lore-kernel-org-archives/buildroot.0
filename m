From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Sep 2017 11:02:24 +0200
Subject: [Buildroot] [PATCH 01/49 v2] package/asterisk: new package
In-Reply-To: <99aa5c38-2b31-f313-19fa-c42e28e37c3c@cartelsol.com>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <ee34d49f318e171beb6b4ba642d04c960aa9560e.1504993178.git.yann.morin.1998@free.fr>
 <99aa5c38-2b31-f313-19fa-c42e28e37c3c@cartelsol.com>
Message-ID: <20170910090224.GA3536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2017-09-10 00:12 +0200, Marcus Hoffmann spake thusly:
> I found a few typos :-).

Given the size of the commit log, I would have been surprised of the
opposite! ;-)

> On 09.09.2017 23:39, Yann E. MORIN wrote:
> > For starters, it needs a host tool, menuselect, to prepare its build
> > configuration. Unfortunately, the way it handles menuselect does not
> > paly very well for cross-compilation: the main ./configure calls out to
> "paly" --> apply?

play

> > [0] http://downloads.asterisk.org/pub/telephony/asterisk/releases/
> > 
> > The official archive contains the sound archives plus a full set of
> > documentation. This makes it very big. Unfotunately, the hosting site is
> 
> "Unfotunately" - missing an r. What does 'very big' actually mean?

The archive is not very big by today's standard: 39MiB. But the site is
really slow, which makes it look like it is bigger than it really is...

Grabbing from the github mirror gives a smaller archive, but more
importantly, it downloads at very high speed.

And since we then only download the strictly minimal set of sounds, we
grab only about 17MiB from asterisk.org instead of 39MiB, which makes
the download at least twice as fast.

> > As a final stroke of genius, asterisk checks for the re-entrant variant
> > of res_ninit(), and concludes that all such functions are available, 
> > of which res_nsearch(). 
> 
> I think a word is probably missing here?

Not that I can think of. The sentence is gramatically equivalent to:

    [it] concludes that all such functions, of which res_nsearch(),
    are available.

except the the part 'of which res_nsearch()' has been relegated to the
end of the sentence, as a mean for it to stand out.

> > +Assume that noone building from now on for cross-compilation will be
> 'noone' -> no one

noone is internet slang from the good ol' days. Seems the young ones
nowadays no longer recognise it! ;-) I'll fix.

> > +# avcodec are from ffmpeg. There is virtually zero chance this could
> > +# even work; 
> 
> "could have ever worked"?

Probably, yes.

Thanks for the review! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
