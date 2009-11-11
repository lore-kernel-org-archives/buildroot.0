From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 11 Nov 2009 16:36:28 -0200
Subject: [Buildroot] [git commit master] buildroot;
	move defconfigs to 	configs/ and print in help
In-Reply-To: <20091111150359.579df608@surf>
References: <20091004202133.B35E577762@busybox.osuosl.org>
	<20091005084845.023ff120@surf> <873a5y5nbq.fsf@macbook.be.48ers.dk>
	<20091111150359.579df608@surf>
Message-ID: <d6cda7730911111036q75d2be10l499409d75940b221@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Nov 11, 2009 at 12:03 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Moreover, it breaks the idea of having out-of-tree board support.
> Before this change, it was relatively easy since the stuff needed to
> support one board was centralized in one directory (see my proposal at
> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?id=ed47f42a598c665bf42c4e797187f233b955e285).
> Now, it's split between a directory in target/device and a file in
> configs/.

Well, I haven't checked the new implementation, but I guess it's in
the line of changing find with ls. If a fallback to the out-of-tree
board support can't be implemented, then I think what we are losing
greatly outweights what we are gaining here.
Currently I have to implement my own board support in a very crude
way, as I'm sticking with the tagged versions to update my SVN
repository. In my crude implementation, I just extended the find to
also look up in my board folder. Having out-of-tree board support
would allow me to get much closer to vanilla buildroot.

Just my 2cts.

Kind Regards,
    Thiago A. Correa
