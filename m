From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Mon, 5 Jan 2015 00:14:47 +0000
Subject: [Buildroot] Newbie: git send-emailerror: fatal:
 0001-hdf5-new-package.patch: 1277: patch contains a line longer than 998
 characters
In-Reply-To: <20150105000858.GH31970@free.fr>
References: <647d2475023349518137c433cd5f6c2e@exch13-mail06.win.slac.stanford.edu>,
 <20150105000858.GH31970@free.fr>
Message-ID: <32d754d70b50421583838e65183d2f02@exch13-mail06.win.slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

________________________________________
From: Yann E. MORIN [yann.morin.1998 at gmail.com] on behalf of Yann E. MORIN [yann.morin.1998 at free.fr]
Sent: Sunday, January 4, 2015 4:08 PM
To: Williams Jr., Ernest L.
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Newbie: git send-emailerror: fatal: 0001-hdf5-new-package.patch: 1277: patch contains a line longer than 998 characters

Ernesto, All,

On 2015-01-05 00:04 +0000, Williams Jr., Ernest L. spake thusly:
> I would like to submit a patch but receive the following error:
>
> [ernesto at localhost outgoing]$ git send-email --smtp-debug=1 --to buildroot at busybox.net --cc ernesto at slac.stanford.edu 0001-hdf5-new-package.patch
> fatal: 0001-hdf5-new-package.patch: 1277: patch contains a line longer than 998 characters
> warning: no patches were sent
>
> Indeed, there is a line longer 998 characters.  This is due to some auto generated code.
>
> Is there a way to get git send-email to ignore this and proceed?

Just run:  git help send-email

       --[no-]validate
           Perform sanity checks on patches. Currently, validation means
           the following:

           ?   Warn of patches that contain lines longer than 998
               characters; this is due to SMTP limits as described by
               http://www.ietf.org/rfc/rfc2821.txt.

           Default is the value of sendemail.validate; if this is not
           set, default to --validate.

;-)

Thanks, that worked. :)

git send-email --smtp-debug=1 --no-validate --to buildroot at busybox.net --cc ernesto at slac.stanford.edu 0001-hdf5-new-package.patch

Cheers,
Ernest



Regards,
Yann E. MORIN.

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
