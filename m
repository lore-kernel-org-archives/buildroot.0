From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 21 Apr 2020 12:13:18 -0500
Subject: [Buildroot] [PATCH v2 3/3] packageJopenjdk: add support for
 building the full jdk
In-Reply-To: <20200418190701.2629613-3-aduskett@gmail.com>
References: <20200418190701.2629613-1-aduskett@gmail.com>
 <20200418190701.2629613-3-aduskett@gmail.com>
Message-ID: <CAMQcK5+ZQVMF3AmYsC+wb+dK=sU34GnTg8ex4jZQsm2kXWhseA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

Thank you for posting this series of patches. Below is some minor feedback:

Title has a misspelling:

s:packageJopenjd:package/openjdk:

On Sat, Apr 18, 2020 at 2:12 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Some users may require the full JDK on the target to debug their programs.
> This change is relatively trivial to add.
>
> While the full JDK does have programs used for compiling on a target,
> which is against Buildroot policy, the JDK also has several utilities used for
> debugging purposes, which the JRE target does not build, and Buildroot supports
> applications used for debugging purposes such as GDB.
>
> As such, JDK support should be available for debugging purposes, and a note in
> the Config.in file has been added under the JDK section, which informs the user
> that JDK support is for debugging purposes only and that developing on a
> target is not supported by Buildroot.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Added a much more thurough commit message as to why the JDK may be useful.

s/thurough/through/

>   - Added a note in the Config.in file explaining that full JDK support is
>     only for debugging purposes.
>   - Added a target_finalize_hook which removes the include and demo directory
>     from the target.
>
>  package/openjdk/Config.in  | 54 ++++++++++++++++++++++++++++++++++++++
>  package/openjdk/openjdk.mk | 21 +++++++++++++--
>  2 files changed, 73 insertions(+), 2 deletions(-)

Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Tested-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Built and runtime tested on x86-64 platform.

Thanks,
-Ryan
