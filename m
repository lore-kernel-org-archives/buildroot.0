From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Jan 2015 19:23:48 +0100
Subject: [Buildroot] [PATCH 2/2] linux/linux.mk: fixed downloading
 kernel patches
In-Reply-To: <54B4F427.7080405@gmail.com>
References: <1421080646-26230-1-git-send-email-ivo.slanina@gmail.com>
 <1421080646-26230-2-git-send-email-ivo.slanina@gmail.com>
 <20150112213812.GB9000@free.fr> <54B4F427.7080405@gmail.com>
Message-ID: <20150113182348.GA7168@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivo, All,

On 2015-01-13 11:32 +0100, Ivo Slanina spake thusly:
> On 01/12/2015 10:38 PM, Yann E. MORIN wrote:
> > Ivo, All,
> > On 2015-01-12 17:37 +0100, Ivo Slanina spake thusly:
> >> Patches located at ftp or http(s) URLs were downloaded using DOWNLOAD
> >> macro. For example, if linux source was located at external git
> >> repository, DOWNLOAD macro uses git scheme as well and buildroot
> >> tried to downlod a path using DOWNLOAD_GIT macro. As a result, nothing
> >> was downloaded and build siletly passes.
[--SNIP--]
> > Which still prompts a question: what if the user has patches he want to
> > download via scp? We do not handle this case for now, right. Should we?
> 
> Yes, this is true. Another solution would be to add optional parameter
> to DOWNLOAD macro in order to force execute scheme="$(call geturischeme,$(1))".
> 
> When I get back from my work, I'll send another patch version :)

No need to "fix" your patch: it is just correct, that's why I replied
with:

> > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Supporting scp would be a new feature, so shouold be done in a separate
patch. You are welcome to provide such another patch if you want, of
course! ;-)

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
