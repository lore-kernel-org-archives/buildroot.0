From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Oct 2019 18:32:38 +0200
Subject: [Buildroot] [PATCH] download: Add SFTP support (not FTPS)
In-Reply-To: <47977bf1-e3cd-dfa8-1362-5405bdf14aa6@codethink.co.uk>
References: <20191003145251.8647-1-thomas.preston@codethink.co.uk>
 <20191006073609.GK10860@scaer>
 <47977bf1-e3cd-dfa8-1362-5405bdf14aa6@codethink.co.uk>
Message-ID: <20191007163238.GQ10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-10-07 10:09 +0100, Thomas Preston spake thusly:
> On 06/10/2019 08:36, Yann E. MORIN wrote:
> > On 2019-10-03 15:52 +0100, Thomas Preston spake thusly:
> >> Add secure file transfer program (sftp) support using a simple wrapper.
> >> SFTP is similar to FTP but it preforms all operations over an encrypted
> >> SSH transport.
> > 
> > We'll want this to be documented in the manual, along with the other
> > download methods (in docs/manual/adding-packages-generic.txt).
> > 
> > Also, as Carlos asked: will you be submitting a package that uses this
> > feature?
> > 
> > If you do not plan to (e.g. because sftp, like scp, is most probably for
> > intra-entreprise private downloads), then it would be nice to provide a
> > test-case for this feature, otherwise it will be subject to bit-rot (if
> > we happen to modify the download infra for example, we can be sure the
> > sftp backend would not break).
> > 
> > You can add a test-case in support/testing/tests/download/.
> > 
> 
> That's right, we require this feature for private downloads.
> 
> I will add documentation in v2. As for testing, would you expect some
> kind of local SFTP server, as with:
> 	support/testing/tests/download/gitremote.py
> 
> Or will a known-working URL do? Ie.
> 	sftp sftp://demo at test.rebex.net/pub/example/readme.txt /tmp

We definitely want to use a local sftp server, yes. The example you
provided does not work for me, and most probably does not work behind
restrictive, enterprise-class firewall-proxies.

We did have a tentative patch in the past about adding test for scp, but
it had comments and was not updated:
    http://lists.busybox.net/pipermail/buildroot/2019-February/242424.html
    http://lists.busybox.net/pipermail/buildroot/2019-March/246460.html

Maybe that can serve as a basis for your sftp test...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
