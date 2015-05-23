From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 May 2015 11:18:14 +0200
Subject: [Buildroot] [PATCH 1/1] scripts/mkusers: allow users with no
 password value set
In-Reply-To: <loom.20150523T080722-553@post.gmane.org>
References: <1432308977-1284-1-git-send-email-james.knight@rockwellcollins.com>
 <20150522221522.GD5153@free.fr>
 <loom.20150523T080722-553@post.gmane.org>
Message-ID: <20150523091814.GB3708@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2015-05-23 06:11 +0000, James Knight spake thusly:
> > On 2015-05-22 11:36 -0400, James Knight spake thusly:
> > > The following allows a user definition to specify that a created 
> user
> > > entry should not have a password value set. Original implementation
> > > allowed a user definition to provide a password value of "-" (no 
> quotes)
> > > to generate a crypt-encoded empty string value. In some cases, it 
> may be
> > > desired to have no value specified for a user's password. By using a
> > > value "-" for a password, no value will be set in the shadow value.
> > 
> > I fail to see how that is different from using an empty password as
> > (without quotes): "="
> > 
> > From man 5 passwd:
> > 
> >     The encrypted password field may be blank, in which case no 
> password
> >     is required to authenticate as the specified login name. However,
> >     some applications which read the /etc/passwd file may decide not 
> to
> >     permit any access at all if the password field is blank.
> > 
> > Thus, I believe it is safest to store an encoded empty password rather
> > than set the password field empty.
> > 
> > Did I miss something?
> > 
> > Of course, the manual could be updated to reflect that a password-less
> > account should use "=" in the password field.
> > 
> > Regards,
> > Yann E. MORIN.
> 
> Logging into a session with an encoded empty password will prompt me to 
> enter a password since it doesn't know the password is empty. In this 
> case, I would simply just hit enter to supply an empty password and it 
> would authenticate.
> 
> If I alternatively set the password field blank, my login session will 
> not prompt a password and will just login (since it knows there is no 
> password set). This is what I'm hoping to achieve for the current target 
> I'm developing.

Ah, right, that's what I missed. OK.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
