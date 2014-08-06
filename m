From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 6 Aug 2014 18:55:17 +0200
Subject: [Buildroot] support/download/wrapper expects file output in
 temp directory but support/wrapper/git produces output.gz
In-Reply-To: <20140806162934.GB3891@free.fr>
References: <20131226222002.C88A59C1E4@busybox.osuosl.org>
 <CACmBeS0dY9NiAPJCTzSQGSH_zx71HN00MJ6Xk0_jD8DjyDwBRw@mail.gmail.com>
 <20140123181504.GB3446@free.fr>
 <CAAXf6LWBScdsOP=E0wC_CGE63R=dq5g21rqaUsWhtfijmU20Wg@mail.gmail.com>
 <53E249EC.9040805@peavey-eu.com> <20140806162934.GB3891@free.fr>
Message-ID: <CAAXf6LU+mrkLV=mm2ifd+i0Oxn8EQjEhbmg_nirLygGJhRrMjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 6, 2014 at 6:29 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Graham, All,
>
> On 2014-08-06 16:29 +0100, Graham Newton spake thusly:
>> Running support/download/wrapper git fails because the final instruction of
>> support/download/git gzips the output file creating output.gz which wrapper
>> isn't expecting.
>
> Doh... I wonder how I could let this slip through... :-(

I also should have caught this in my testing. I now understand why
this happened: sources.buildroot.net also contains the tar file of the
package I tried in my testing, and I did not actually verify the build
output. Since the package was downloaded and the contents looked ok, I
assumed the git download wrapper was fine.
Very bad testing on my part, my apologies!

Best regards,
Thomas
