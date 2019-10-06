From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Oct 2019 09:42:53 +0200
Subject: [Buildroot] [PATCH] download: Add SFTP support (not FTPS)
In-Reply-To: <CAJ4jsafP=nACBu_Xz+E07Honmf0dSDjFw7HS8fPn65gPyv4KEQ@mail.gmail.com>
References: <20191003145251.8647-1-thomas.preston@codethink.co.uk>
 <CAJ4jsafP=nACBu_Xz+E07Honmf0dSDjFw7HS8fPn65gPyv4KEQ@mail.gmail.com>
Message-ID: <20191006074253.GL10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-10-05 00:02 -0300, Carlos Santos spake thusly:
> On Thu, Oct 3, 2019 at 11:53 AM Thomas Preston
> <thomas.preston@codethink.co.uk> wrote:
> > Add secure file transfer program (sftp) support using a simple wrapper.
> > SFTP is similar to FTP but it preforms all operations over an encrypted
> > SSH transport.
[--SNIP--]
> You intend to add packages that require this feature, I suppose.

I agree with you that we usually do require that we have in-tree users of
new infrastructures.

However, for the download mechanisms, we already have two of them that
have no in-tree users: cvs and scp.

While cvs is a remnant for the days-past, scp is mostly used for
internal resources in enterprise networks. I expect sftp to be used
in the same situation as scp is.

So, I don't see a reason to block it, but as you point out, without an
in-tree user, we can't guarantee the feature will not break. So, I asked
Thomas he sent an updated patch with a test-case.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
