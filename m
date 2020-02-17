From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 17 Feb 2020 09:10:08 +0100
Subject: [Buildroot] [PATCH 1/2] support/run-tests: reorder imports
In-Reply-To: <87r1ytd4kd.fsf@dell.be.48ers.dk>
References: <20200213100906.11506-1-yegorslists@googlemail.com>
 <87eeuufvg8.fsf@dell.be.48ers.dk>
 <CAGm1_ktU8-WuO=93jBRts7TExzJ=NbZYKO0QzbzWuthQYuaAqQ@mail.gmail.com>
 <87r1ytd4kd.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_ktNXE41xmTqVb5vBbJvZJ2sik0XZ9f8wxEg9iDVTs=53w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 17, 2020 at 9:02 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
>
>  > Hi Peter,
>  > On Sun, Feb 16, 2020 at 3:39 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>  >>
>  >> >>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
>  >>
>  >> > From: Yegor Yefremov <yegorslists@googlemail.com>
>  >> > Reorder imports using the isort utility.
>  >>
>  >> Why? Does the current order cause any issues or warnings from linters?
>
>  > I get this warning:
>
>  > wrong-import-order: standard import "import multiprocessing" should be
>  > placed before "import nose2"
>
> Ok, From what checker do you get this warning?

pylint3 support/testing/run-tests

No config file found, using default configuration
************* Module run-tests
C:  1, 0: Module name "run-tests" doesn't conform to snake_case naming
style (invalid-name)
C:  1, 0: Missing module docstring (missing-docstring)
C: 11, 0: Missing function docstring (missing-docstring)
C: 73,29: Do not use `len(SEQUENCE)` to determine if a sequence is
empty (len-as-condition)
C:115, 7: Do not use `len(SEQUENCE)` to determine if a sequence is
empty (len-as-condition)
R: 11, 0: Either all return statements in a function should return an
expression, or none of them should. (inconsistent-return-statements)
R: 11, 0: Too many return statements (7/6) (too-many-return-statements)
R: 11, 0: Too many branches (14/12) (too-many-branches)
R: 11, 0: Too many statements (64/50) (too-many-statements)
C:  6, 0: standard import "import multiprocessing" should be placed
before "import nose2" (wrong-import-order)

------------------------------------------------------------------
Your code has been rated at 8.73/10 (previous run: 8.73/10, +0.00)
