From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 19 Jul 2010 18:37:37 +0200
Subject: [Buildroot] buildroot not using my proxy settings
In-Reply-To: <EE93B8B6CB04054E896A0763A45EF9EB01A51CFD@SONDA-EXCH01.sonda.com>
References: <EE93B8B6CB04054E896A0763A45EF9EB01A51CFD@SONDA-EXCH01.sonda.com>
Message-ID: <201007191837.37571.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Roberto, All,

On Monday 19 July 2010 18:04:50 Saa Isamit, Roberto wrote:
> I have global proxy settings in my system but apparently
> buildroot is not using them:
> "export" command:
> declare -x http_proxy="http://localhost:5865/"
[--SNIP--]
> Does anyone know if there is another thing to configure to
> get buildroot to use my proxy settings?

You'll most probably also need:
  https_proxy=blah...
  ftp_proxy=blah...

And if you need any other protocol (eg. git: or svn:) you might not be able
to tunnel that through your proxy, unless it accepts CONNECT to any port
(but most enterprise proxies refuse CONNECT to anything but 443).

In this case, you need to see if a socks proxy is available, and use tsocks.
And then it an be tricky, because enterprise socks proxies may also refuse
to tunnel some ports (eg. allow 22 and nothing else).

<rant> Proxies in entreprises are a real PITA... :-( </rant>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
