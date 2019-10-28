From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2019 22:28:55 +0100
Subject: [Buildroot] [PATCH v3 3/4] support/testing: switch to Python 3
 only
In-Reply-To: <20191027133630.7706-3-nicolas.carrier@orolia.com>
References: <20191027133630.7706-1-nicolas.carrier@orolia.com>
 <20191027133630.7706-3-nicolas.carrier@orolia.com>
Message-ID: <28e1ff39-7aae-ee42-a5c1-6772b4820249@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/10/2019 14:37, Nicolas Carrier wrote:
> From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
> Python 2.7 will not be maintained past 2020.
> 
> Many scripts on the tree are used during the build and should keep
> Python 2 compatibility for a while.
> This is not the case for the runtime test infra. It's meant to be run in
> modern distros only, so it can safely switch to support Python 3 only.
> 
> An advantage of this approach is to have less scenarios to test in.
> Otherwise every change to the test infra or runtime tests would need to
> be tested against both versions of the interpreter, increasing the
> effort of the developers, to ensure the compatibility to Python 2 was
> not broken.
> 
> In order to accomplish the change to Python 3:
>  - change the shebang for run-tests;
>  - use Python 3 urllib as a drop-in replacement for Python 2 urllib2;
>  - when writing the downloaded binary files, explicitly open the output
>    file as binary;
>  - when subprocess is used to retrieve the text output from commands,
>    explicitly ask for text output. For this, use 'universal_newlines'
>    because 'text' was added only on Python 3.7;
>  - when pexpect is used to retrieve the text output from qemu or git,
>    explicitly ask for text output using 'encoding';
>  - the code using csv currently follows the example in the documentation
>    for the Python 2 module, change it to follow the example in the
>    documentation for the Python 3 module;
>  - fix the relative import for test_git.py to be Python 3 compliant.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Tested-by: Romain Naour <romain.naour@smile.fr>
> Tested-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

 Applied to master, thanks.

 Regards,
 Arnout
