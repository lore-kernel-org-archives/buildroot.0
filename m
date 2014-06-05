From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Thu, 05 Jun 2014 14:18:22 -0700
Subject: [Buildroot] Build Output
In-Reply-To: <20140605223928.3794a407@free-electrons.com>
References: <5390C49C.9080209@ethertek.ca>
 <20140605223928.3794a407@free-electrons.com>
Message-ID: <5390DE9E.1010003@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6/5/2014 1:39 PM, Thomas Petazzoni wrote:
> Dear Dan Pattison,
>
> On Thu, 05 Jun 2014 12:27:24 -0700, Dan Pattison wrote:
>
>> I am using the post image script feature to compile and install various
>> custom packages. In my shell and make files I want to make the ouput
> Why don't you create additional Buildroot packages instead? That would
> be a lot more logical that doing this in a post-image script.
>
> Thomas

Hello Thomas,

Thank you for the reply. I found the need to run some custom scripts 
just before the images are created to do various things like add a 
firmware build number file, tar up the /etc folder for use in a factory 
reset situation, and a few other product specific jobs. As it is doing 
each step, it's nice to get the highlighted output for debugging. For 
whatever reason, I started building some custom packages from the 
post-image script also. Peter showed me a way to do the highlight from 
my shell script by making a custom MESSAGE() function.

MESSAGE() {
     tput smso
     echo ">>> $*"
     tput rmso
}

MESSAGE hello world

Thanks,
Dan Pattison
EtherTek Circuits
