From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 8 Sep 2009 08:27:07 +0200
Subject: [Buildroot] [PATCH 1/5] Remove the "project" feature
In-Reply-To: <a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20090908082707.18e19d6e@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Sep 2009 00:09:49 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> The "project" feature was designed to allow to several projects to be
> built inside the same Buildroot source tree and allowing the toolchain
> and non-configurable packages to be shared between the different
> projects on the same architecture. While being interesting in theory,
> this feature adds a level of complexity to Buildroot, both from an
> user perspective and from a developer perspective, while one of the
> main Buildroot strengh is to be simple. Moreover, this feature is only
> seldomly used by our users.
>

I use it all the time ;) How do you propose building for multiple
targets? I would at least like to share the toolchain, preferably also
libraries.

I do however also like the KISS aspect of Buildroot.

> >From a user-level perspective, this for example allows to remove the
> project_build_ARCH directory, which was very confusing. The
> autotools-stamps directory is also removed, since these stamps are
> back at their normal location.
> 

I did not think project_build_ARCH was confusing, but perhaps project_
part would be misleading? I would rather see a build/board/<stuff>
setup.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
