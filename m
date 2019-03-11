From: yann.morin at orange.com <yann.morin@orange.com>
Date: Mon, 11 Mar 2019 08:02:56 +0100
Subject: [Buildroot] ? using compilers other than gcc!
In-Reply-To: <43556bee-b905-8e11-c71d-d87aa92d13f5@lamiaworks.com.au>
References: <43556bee-b905-8e11-c71d-d87aa92d13f5@lamiaworks.com.au>
Message-ID: <4380_1552287778_5C860822_4380_384_1_20190311070256.GA2834@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sccijon, All,

On 2019-03-11 13:04 +1100, scsijon spake thusly:
> Downloaded the latest 2019-02 buildroot, I found where to set musl, but
> can't see how to change the compiler from gcc to another and I want to try
> the latest pcc?

Buildroot only supports gcc.

> However it has now seriously surfaced again into the general linux world,
> with a few decent step-ups, and worth at least looking at as far as i'm
> concerned, like it's still fast and tight and it's MUSL aware, needs only
> one library package for us to work with, builds it's own GCC, and can
> rebuild itself. And NO it doesn't do everything GCC does, but do we really
> need all that.....
> 
> Links worth looking at are
> https://www.phoronix.com/scan.php?page=news_item&px=PCC-Still-Going-2016;

That dates back from more than 3 years ago now...

> http://pcc.ludd.ltu.se/supported-platforms/;

Nothing new in the "News" section since July 2015 (almost 4 years ago
now).

> https://lwn.net/Articles/255558/.

Article dated from 2007. Hardly recenti either...

So much so for something that "has now seriously surfaced again", I'm
afraid... :-/

> Yeah, I know none of them are new, but the people behind the latest stuff
> put it in the work, not the doc's.

Their cvs (irk!) server is down:
    http://pcc.ludd.ltu.se/fisheye/
    503 Service Temporarily Unavailable

> You can get it and it's library at http://pcc.ludd.ltu.se/ftp/pub/pcc/ if it
> interests you.
> 
> So, back to the question, how can I use it?

Short answer: you can't.

Long answer: you can prepare a set of patches against Buildroot, to
enable using an alternate compiler, but this is probably a daunting
task, as everything everywhere in the infra expects gcc. Packages
also expect gcc, and when they do allow for something else, it's
probably clang, not pcc. Also, pcc is C only. So, such an endeavour
would probably last years before you could eventually select pcc in
Buildroot.

So, if I were you, I wouldn't hold my breath...

The best candidate nowadays for an alternative to gcc, is clang.

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
