From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Thu, 05 Jun 2014 14:00:06 -0700
Subject: [Buildroot] Build Output
In-Reply-To: <87ppinm7jy.fsf@dell.be.48ers.dk>
References: <5390C49C.9080209@ethertek.ca> <87ppinm7jy.fsf@dell.be.48ers.dk>
Message-ID: <5390DA56.30508@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6/5/2014 1:21 PM, Peter Korsgaard wrote:
>>>>>> "Dan" == Dan Pattison <dan.pattison@ethertek.ca> writes:
>   > Hello,
>   > I am using the post image script feature to compile and install
>   > various custom packages. In my shell and make files I want to make the
>   > ouput show the various stages of package installation like buildroot
>   > does with text that has a highlighted back ground. This helps in
>   > debugging to see where certain programs start their build process.
>
>   > For instance, when the post-image script fires it outputs the line
>   > below with a highlighted back ground that is easy to spot.
>   >>>> Executing post-image script board/ethertek/ws/post-build.sh
>
>   > I tried the line below in my own post-build.sh, but get a command not
>   > found error.
>   > $(call MESSAGE,"Building Package FOO");
>
>   > Is it possible to make the call command above work in my own shell
>   > scripts that reside in the board folder? If yes, what do I include to
>   > make that work?
>
> Not really. MESSAGE is a make macro, so you cannot use it from a shell
> script.
>
> But you can take a look at the implementation in package/pkg-utils.mk
> and create a similar shell function, something like:
>
> MESSAGE() {
>      tput smso
>      echo ">>> $*"
>      tput rmso
> }
>
> MESSAGE hello world
>
Hello Peter,

Thanks for the reply. I will try that.

Dan Pattison
Ethertek Circuits
