From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 5 May 2009 11:24:20 -0300
Subject: [Buildroot] Create user git repository at uclibc.org
In-Reply-To: <20090505074609.GA22117@buzzloop.caiaq.de>
References: <d6cda7730905041746p7a9e8eaeg4ab32b4016ba73e6@mail.gmail.com>
	<20090505074609.GA22117@buzzloop.caiaq.de>
Message-ID: <d6cda7730905050724x45485cf5qf520075d1fa6d0f3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daniel,

2009/5/5 Daniel Mack <daniel@caiaq.de>:
> On Mon, May 04, 2009 at 09:46:30PM -0300, Thiago A. Corr?a wrote:
>> ? ?Peter, I'm still lost here :(
>> ? ?I've created a git folder at my home then did a git clone from
>> buildroot, but that didn't expose a private branch. Then I thought I
>> needed to do a git init, but then again, all I got was a .git folder.
>> ? ?As I said, your message [1] still isn't clear to those of us who
>> don't know this beast.
>
> There is no 'private branch' in the upstream git. You need to create one
> for your purpose after cloning with 'git checkout -b myprivatebranch'.

Sorry, I think I didn't express myself clearly. What I want is a tree,
based on the upstream tree so that I can send Peter pull requests from
there. From what I understand, to do that I need a public tree
somewhere, and since I had commit access to svn before, that somewhere
could be uclibc.org.

But I don't know how to setup that public repository, from where I
will later on my local machine do the git clone from and checkout for
creating branches in my private tree.

> See http://www.kernel.org/pub/software/scm/git/docs/gittutorial.html and
> all the other docs on this site. A post that I found quite comprehensive
> is http://tomayko.com/writings/the-thing-about-git.

I've read a couple of documents already, including the git for svn users.

I think I figured what I should do... I guess I should do:
ssh uclibc.org
mkdir git; cd git
git init
mv .git buildroot.git
touch buildroot.git/git-daemon-export-ok

Well, I will have to wait for another hour for the cronjob to see if
that's what I was supposed to do.

Any ideas how to keep an svn tree in sync with the git tree?
Previously I used svn merge, but now I have no idea what to do.

Kind Regards,
   Thiago A. Correa
