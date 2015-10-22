From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Oct 2015 18:39:02 +0200
Subject: [Buildroot] [PATCH 2/2] jq: enable host package
In-Reply-To: <20151021223958.5605a589@free-electrons.com>
References: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
 <1445251329-18120-2-git-send-email-patrickdepinguin@gmail.com>
 <20151021223958.5605a589@free-electrons.com>
Message-ID: <20151022163902.GA3797@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2015-10-21 22:39 +0200, Thomas Petazzoni spake thusly:
> On Mon, 19 Oct 2015 12:42:09 +0200, Thomas De Schampheleire wrote:
> > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> > 
> > Allow building jq as host utility for use in post-build scripts.
> > This can be useful to created, edit, merge or even perform syntax checking
> > on JSON files.
> > 
> > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Since this host package clearly doesn't fall into the "debugging tool,
> flashing tool or image preparation tool" category, I'd like to collect
> the opinion of a few other developers before applying.
> 
> Peter, Arnout, Yann, what do you think?

On principle, I'm OK with user-selectable host packages, as long as there
is a real benefit to having it, like:
  - image preparation tools (fs, flash, dtc, bootloader utils...)
  - configuration tools (pwgen, SElinux compiler...)
  - debug tools

(Note: I'm not listing dependency of target package, since that is not
user-selectable.)

Adding any other type of package to be user-selectable will always be
debatable. I'm not sure where we should draw the line, but we could
provide guidelines, like:

  - the package is not usually packaged in distributions (or too old);
    libxslt for xsltproc comes to mind for example;

  - the submitter comes with a very clear use-case which can not
    otherwise be solved by other means (overlays, conditionals in
    post-build scripts...)

Now, as far as host-jq is concerned, I'm not very sure. The use-case
Thomas DS. invoques is tweaking config files for various targets.

Even though I understand that, and even though I could have thought the
same, I'm still not quite sure. JSON is indeed a pretty much usual
configuration format those days (whether that is sane is a question for
another thread ;-] ). However, I would argue (weakly) that this tool
should be provided by the host environment, not us.

Except: old, enterprise-class distributions (e.g. RHEL5) may lack that
tool, especially since it was born in 2012.

So, really, I wouln't really argue either way.

But surely, this would be our first host-package that is not in the
categories I listed above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
