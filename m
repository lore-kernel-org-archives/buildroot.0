From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Feb 2015 21:19:13 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5multimedia: fix compile without
 opengl
In-Reply-To: <trinity-9cb7699f-7c2e-4558-b3cb-1dca2d23bb59-1422989545184@3capp-gmx-bs52>
References: <trinity-9793f5a9-f1ef-4912-92e4-dc7acbb69ddc-1422481699290@3capp-gmx-bs31>,
 <54D0F5A1.8040004@mind.be>
 <trinity-9cb7699f-7c2e-4558-b3cb-1dca2d23bb59-1422989545184@3capp-gmx-bs52>
Message-ID: <54D12D41.4080204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/02/15 19:52, Peter Seiderer wrote:
> Hello Arnout,
>
> > Gesendet: Dienstag, 03. Februar 2015 um 17:21 Uhr
> > Von: "Arnout Vandecappelle" <arnout@mind.be>
> > An: "Peter Seiderer" <ps.report@gmx.net>, "Thomas Petazzoni"
> <thomas.petazzoni@free-electrons.com>
> > Cc: buildroot at busybox.net
> > Betreff: Re: [Buildroot] [PATCH v2 1/2] qt5multimedia: fix compile without
> opengl
> >
> > On 28/01/15 22:48, Peter Seiderer wrote:
> >> But I searched upstream git, there is already a fix in 5.4.1/dev branch
> >> fixing this problem ([1]), but as I think doing it the wrong way,
> >> disabling Format_RGB24 for the non-OpenGL case ([2]), but a follow up
> >> patch fixing the issue is on its way upstream ([3])...
> >
> >  Could you then submit those two upstream patches? Either separately or
> > squashed, but with a reference to the upstream commit and your SoB.
> >
>
> Mhh, I understand the reasoning for grabbing upstream patches, but in this case
> I am not sure its worth the work to possibly rebase the upstream version (in case
> they do not apply cleanly, or to squash them), to get nearly the same result as
> with the suggested patch, the fix for [2] with [3] is derived work of my suggested
> buildroot patch ;-)
>
> Less work would be to just add the upstream references to the commit message
> and/or the patch...


 Ah OK, to me it looked as if the upstream patches were handling the situation
differently, but I hadn't taken the time to look at them in detail.

 If you're doing basically the same thing, then your patch is OK as if of
course. The upstream references are still useful but it could be applied without it.

 So basically:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
