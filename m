From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:59:34 +0200
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
	w/threads
In-Reply-To: <871tk3r03i.fsf@dell.be.48ers.dk>
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150401234340.1717eaf2@free-electrons.com>
 <871tk3r03i.fsf@dell.be.48ers.dk>
Message-ID: <20150401235934.58eded2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 01 Apr 2015 23:48:49 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
> > Also, there's something fishy between jamvm and classpath.
> 
>  > jamvm does select BR2_PACKAGE_CLASSPATH and has classpath in
>  > JAMVM_DEPENDENCIES.
> 
>  > But classpath has depends on BR2_PACKAGE_JAMVM in its Config.in.
> 
>  > Does not make much sense. Peter, you followed the JamVM/Classpath
>  > stuff. What do you think?
> 
> Hmm, that indeed doesn't sound right. I think the jamvm select should be
> dropped from classpath.

There's no jamvm select in classpath, it's a 'depends on':

config BR2_PACKAGE_JAMVM
        bool "jamvm"
        select BR2_PACKAGE_CLASSPATH

config BR2_PACKAGE_CLASSPATH
        bool "classpath"
        depends on BR2_PACKAGE_JAMVM

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
