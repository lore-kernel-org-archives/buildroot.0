From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 May 2009 17:12:36 +0200
Subject: [Buildroot] Create user git repository at uclibc.org
In-Reply-To: <d6cda7730905050724x45485cf5qf520075d1fa6d0f3@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue\, 5 May 2009
	11\:24\:20 -0300")
References: <d6cda7730905041746p7a9e8eaeg4ab32b4016ba73e6@mail.gmail.com>
	<20090505074609.GA22117@buzzloop.caiaq.de>
	<d6cda7730905050724x45485cf5qf520075d1fa6d0f3@mail.gmail.com>
Message-ID: <871vr3h9cr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Hi Daniel,
 Thiago> 2009/5/5 Daniel Mack <daniel@caiaq.de>:
 >> On Mon, May 04, 2009 at 09:46:30PM -0300, Thiago A. Corr?a wrote:
 >>> ? ?Peter, I'm still lost here :(
 >>> ? ?I've created a git folder at my home then did a git clone from
 >>> buildroot, but that didn't expose a private branch. Then I thought I
 >>> needed to do a git init, but then again, all I got was a .git folder.
 >>> ? ?As I said, your message [1] still isn't clear to those of us who
 >>> don't know this beast.
 >> 
 >> There is no 'private branch' in the upstream git. You need to create one
 >> for your purpose after cloning with 'git checkout -b myprivatebranch'.

 Thiago> Sorry, I think I didn't express myself clearly. What I want is a tree,
 Thiago> based on the upstream tree so that I can send Peter pull requests from
 Thiago> there. From what I understand, to do that I need a public tree
 Thiago> somewhere, and since I had commit access to svn before, that somewhere
 Thiago> could be uclibc.org.

 Thiago> But I don't know how to setup that public repository, from where I
 Thiago> will later on my local machine do the git clone from and checkout for
 Thiago> creating branches in my private tree.

Simply do:

ssh uclibc.org
mkdir -p git && cd git
git clone --bare git://git.buildroot.net/buildroot buildroot.git
touch buildroot.git/git-daemon-export-ok
exit

Back on your local pc you do:

git clone uclibc.org:~/git/buildroot.git

do your local commits, branches and whatever and push them to your
repo on uclibc.org with git push

Other people can also clone your repo using:

git clone git://git.buildroot.net/~correa/git/buildroot.git

And view it online at:

http://git.buildroot.net/~correa/git/buildroot/

-- 
Bye, Peter Korsgaard
