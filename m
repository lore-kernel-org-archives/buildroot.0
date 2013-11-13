From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Nov 2013 08:34:22 +0100
Subject: [Buildroot] [git commit] legal info: fix saving of host package
	licenses
In-Reply-To: <20131112222456.9EC029BB31@busybox.osuosl.org>
References: <20131112222456.9EC029BB31@busybox.osuosl.org>
Message-ID: <CAAXf6LUxdhxXxJXFbn6d7pV6TrxtoiW6-dwAv_JBPxcEdoqoHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Nov 12, 2013 at 11:20 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=003d38da3a716b0a19e980fb69a6cd55b353f4f3
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Due to some tricky make behavior, the license texts of host packages that
> did not provide an explicit HOST_FOO_LICENSE_FILES definition was not saved.
> The problem is that it is not straightforward to use a variable
> defined/updated inside an evaluated block as input to a foreach statement.
> If you try to use $(FOO) then only the original value of FOO is used for
> foreach, any update inside the block is ignored. However, if you use
> $$(FOO), the entire contents of FOO (typically a list of items) is passed
> as one item to foreach, thus causing just one iteration instead of several.
>
> >From Arnout Vandecapelle's explanation:
> Any variable referenced with a single $ inside the inner-generic-package
> macro is expanded before the resulting contents are eval'ed. Therefore, it
> is not possible to refer to variables defined by the inner-generic-package
> macro from within a single-$ function call.
>
> To fix the problem, one should defer the evaluation of the entire block
> using double dollar signs.
>
> Additionally, a few empty lines have been added to the legal-info-foo block
> for clarity.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Is there a particular reason why the 5 other patches in this series
(splitting the legal info output between host/target) have not been
applied? I think they still fit in 2013.11...

Best regards,
Thomas
