From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Nov 2017 18:03:10 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: no longer require openssl
In-Reply-To: <87fu9peysf.fsf@dell.be.48ers.dk>
References: <20171107212906.31336-1-Adamduskett@outlook.com>
 <20171108114348.491097e5@windsurf>
 <87fu9peysf.fsf@dell.be.48ers.dk>
Message-ID: <20171108180310.144957c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 08 Nov 2017 13:32:32 +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:  
> 
>  > Hello,
>  > On Tue,  7 Nov 2017 16:29:06 -0500, Adam Duskett wrote:  
>  >> 4.2.8p10 no longer requires openssl to compile.
>  >> 
>  >> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>  
> 
>  > Peter: I'm wondering if we should apply this to next or master. It is
>  > not a bug fix per-se, but it fixes a kind of regression introduced with
>  > the bump of ntp to 4.2.8p9, which was merged in 2017.02, and brought in
>  > OpenSSL as a mandatory dependency. A user reported on Github that it
>  > increased quite a lot the installed size (due to the additional OpenSSL
>  > dependency).  
> 
>  > So, I'm tempted to apply this to master. Peter, are you OK?  
> 
> Yes. I've just applied it. I will also cherry pick to the LTS branch.

Be careful if you cherry-pick in the LTS branch: it depends on p10
version of ntp, which was committed after 2017.02 was released. I
haven't looked if the p10 bump has already been cherry-picked in the
LTS branch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
